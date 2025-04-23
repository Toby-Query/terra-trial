import click
import requests
from dotenv import load_dotenv
import os

load_dotenv()

API_URL = os.getenv("API_URL")

@click.group()
def cli():
    """A CLI to interact with the FastAPI backend."""
    pass

@cli.command()
@click.option("--name", prompt="User name", help="The name of the user.")
@click.option("--email", prompt="User email", help="The email of the user.")
def add_user(name, email):
    """Add a new user."""
    response = requests.post(API_URL, params={"name": name, "email": email})
    if response.status_code == 200:
        click.echo(f"User added: {response.json()}")
    else:
        click.echo(f"Error: {response.status_code} - {response.text}")

@cli.command()
def fetch_users():
    """Fetch all users."""
    response = requests.get(API_URL)
    if response.status_code == 200:
        users = response.json()
        for user in users:
            click.echo(f"ID: {user['id']}, Name: {user['name']}, Email: {user['email']}")
    else:
        click.echo(f"Error: {response.status_code} - {response.text}")

if __name__ == "__main__":
    cli()