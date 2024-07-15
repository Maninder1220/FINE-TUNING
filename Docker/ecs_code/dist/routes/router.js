"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const router = (0, express_1.Router)();
router.get("/", (req, res) => res.json({ message: "Hello from Docker v3 🎉" }));
router.get("/health", (req, res) => {
    throw new Error("Internal Server Error");
    res.status(200).json({ message: "Everything is good here 👀" });
});
exports.default = router;
