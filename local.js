import http from "node:http";
import { handler } from "./src/story.js";

const server = http.createServer(async (req, res) => {
  if (req.method === "POST" && req.url === "/story") {
    let raw = "";
    req.on("data", chunk => raw += chunk);
    req.on("end", async () => {
      const result = await handler({ httpMethod: "POST", body: raw });
      res.writeHead(result.statusCode, result.headers);
      res.end(result.body);
    });
    return;
  }

  res.writeHead(404, { "Content-Type": "application/json" });
  res.end(JSON.stringify({ error: "Not found" }));
});

server.listen(3000, () => {
  console.log("BrightPath local API listening on http://localhost:3000/story");
});