import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import child_process from "node:child_process";

const VAULT_DIR = path.resolve(os.homedir(), "Documents", "Obsidian Vault");
const NOTE_PATH_TEMPLATE = "YYYY/MM-MMM/YYYY-MM-DD-dddd.md";
const DAILY_NOTE_DIR = path.resolve(VAULT_DIR, "Daily");

function toPath(date, format = NOTE_PATH_TEMPLATE) {
  const months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  const days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];

  const year = date.getFullYear();
  const month = date.getMonth();
  const dayOfMonth = date.getDate();
  const dayOfWeek = date.getDay();

  const twoDigitMonth = (month + 1).toString().padStart(2, "0");
  const twoDigitDay = dayOfMonth.toString().padStart(2, "0");

  const formatted = format
    .replace(/YYYY/g, year)
    .replace(/MMM/g, months[month].substring(0, 3))
    .replace(/MM/g, twoDigitMonth)
    .replace(/DD/g, twoDigitDay)
    .replace(/dddd/g, days[dayOfWeek]);

  return path.resolve(DAILY_NOTE_DIR, formatted);
}

function getDayBefore(date) {
  const previousDay = new Date(date);
  previousDay.setDate(date.getDate() - 1);
  return previousDay;
}

function findPreviousDailyNote() {
  let found;
  let date = getDayBefore(new Date());
  while (!found) {
    const path = toPath(date);
    if (fs.existsSync(path)) {
      return path;
    } else {
      date = getDayBefore(date);
    }
  }
  return found;
}

function read(path) {
  const content = fs.readFileSync(path, "utf-8");
  return content;
}

function write(path, content) {
  return fs.writeFileSync(path, content, "utf-8");
}

function parseNote(markdownContent) {
  function parseMarkdown(markdown) {
    const lines = markdown.split("\n");
    const rootNodes = [];
    const nodeStack = [];

    lines.forEach((line) => {
      const level = getIndentationLevel(line);
      const content = line.trim();

      if (content.startsWith("#")) {
        // Heading
        const newNode = { content, children: [] };
        addNode(rootNodes, nodeStack, level, newNode);
      } else if (content.startsWith("-") || content.startsWith("*")) {
        // List item
        const newNode = { content, children: [] };
        addNode(rootNodes, nodeStack, level, newNode);
      } else {
        addNode(rootNodes, nodeStack, 1, { content, children: [] });
      }
    });

    return { content: "", children: rootNodes };
  }

  function getIndentationLevel(line) {
    let level = 0;
    const matches = line.match(/^\t+/); // Using tabs for indentation
    if (matches) {
      level = matches[0].length;
    }
    return level;
  }

  function addNode(rootNodes, nodeStack, level, newNode) {
    while (
      nodeStack.length > 0 &&
      nodeStack[nodeStack.length - 1].level >= level
    ) {
      nodeStack.pop();
    }

    if (nodeStack.length === 0) {
      rootNodes.push(newNode);
    } else {
      nodeStack[nodeStack.length - 1].node.children.push(newNode);
    }

    nodeStack.push({ level, node: newNode });
  }
  return parseMarkdown(markdownContent);
}

function hasUnfinishedTodo(block) {
  let found = false;

  function walkBlock(block) {
    if (found) {
      return;
    }
    if (block.content.includes("[ ]")) {
      found = true;
    }
    block.children.map(walkBlock);
  }

  walkBlock(block);

  return found;
}

function isHeaderOrHasUnfinishedTodo(block) {
  return block.content.startsWith("#") || hasUnfinishedTodo(block);
}

function transformBlock(block) {
  block.children = block.children
    .filter(isHeaderOrHasUnfinishedTodo)
    .map(transformBlock);
  return block;
}

function renderBlock(block, depth = 0) {
  const lines = [];
  function appendBlock(block, d) {
    if (block.content !== "") {
      const prefix = Array(d - 1)
        .fill("\t")
        .join("");
      lines.push(`${prefix}${block.content}`);
    }
    for (const child of block.children) {
      appendBlock(child, d + 1);
    }
  }
  appendBlock(block, depth);
  return lines.join("\n");
}

function hasTodaysNote() {
  const p = toPath(new Date());
  return fs.existsSync(p);
}

function createDailyNote() {
  const previousNote = findPreviousDailyNote();
  const previousContent = read(previousNote);
  const parsed = parseNote(previousContent);

  const transformed = transformBlock(parsed);
  write(toPath(new Date()), renderBlock(transformed));
}

function openDailyNote() {
  const args = [path.resolve(toPath(new Date()))];
  child_process.spawnSync("code", args);
}

if (!hasTodaysNote()) {
  createDailyNote();
}

openDailyNote();
