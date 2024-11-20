#!/usr/bin/env sh

npm run dev >/dev/null 2>/dev/null &
VITE_PID=$!

# Wait for the server to start
sleep 1

echo "vite dev:"
curl http://localhost:5173/file
echo "------"

kill $VITE_PID

npm run build >/dev/null 2>/dev/null
npm run preview >/dev/null 2>/dev/null &
VITE_PID=$!

# Wait for the server to start
sleep 1

echo "vite preview:"
curl http://localhost:4173/file
echo "------"

kill $VITE_PID

npm run start >/dev/null 2>/dev/null &
NODE_PID=$!

# Wait for the server to start
sleep 1

echo "vite-express (dev)"
curl http://localhost:3000/file
echo "------"

kill $NODE_PID

NODE_ENV=production npm run start >/dev/null 2>/dev/null &
NODE_PID=$!

# Wait for the server to start
sleep 1

echo "vite-express (prod)"
curl http://localhost:3000/file
echo "------"

kill $NODE_PID
