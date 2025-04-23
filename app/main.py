from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session
import crud
import models
from database import SessionLocal, engine

models.Base.metadata.create_all(bind=engine)

app = FastAPI()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/users/")
def read_users(db: Session = Depends(get_db)):
    return crud.get_users(db)

@app.post("/users/")
def add_user(name: str, email: str, db: Session = Depends(get_db)):
    return crud.create_user(db, name, email)
