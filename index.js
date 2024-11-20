import express from "express";
import ViteExpress from "vite-express";

const app = express();
const server = app.listen(3000, () => console.log("listening on 3000"));
ViteExpress.bind(app, server);
