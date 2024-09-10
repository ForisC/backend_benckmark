
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def read_root():
    return {"message": "Hello, World!"}

@app.get("/sync")
def read_root_sync():
    return {"message": "Hello, World!"}
