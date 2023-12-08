import os
import sys
import pandas as pd
from tabulate import tabulate
from dotenv import load_dotenv
from sqlalchemy import create_engine, text
from sqlalchemy.exc import OperationalError, ProgrammingError, NoSuchModuleError
from IPython.display import display, Markdown

config_map = {
    "user": "CMSC508_USER",
    "password": "CMSC508_PASSWORD",
    "host": "CMSC508_HOST",
    "database": "FINAL_DB_NAME",
}
# load and store credentials
load_dotenv()
config = {}
for key in config_map.keys():
    config[key] = os.getenv(config_map[key])
flag = False
for param in config.keys():
    if config[param] is None:
        flag = True
        print(f"Missing {config_map[param]} in .env file")

# build a sqlalchemy engine string
engine_uri = f"mysql+pymysql://{config['user']}:{config['password']}@{config['host']}/{config['database']}"

try:
    conn = create_engine(engine_uri)
except ArgumentError as e:
    print(f"create_engine: Argument Error: {e}")
    # sys.exit(1)
except NoSuchModuleError as e:
    print(f"create_engine: No Such Module Error: {e}")
    # sys.exit(1)
except Exception as e:
    print(f"create_engine: An error occurred: {e}")
    # sys.exit(1)


def my_sql_wrapper(query):
    """takes a query and returns a pandas dataframe for output"""
    try:
        df = pd.read_sql(query, conn)
    except Exception as e:
        df = pd.DataFrame({"Query error": ["(see error message above)"]})
        msg = str(e).replace(") (", ")\n(")
        print(msg)
    return df


def my_sql_statement(statement):
    """used with DDL, when the statement doesn't return any results."""
    try:
        conn.connect().execute(text(statement))
        result = ""
    except Exception as e:
        result = f"Error: {str(e)}"
    return result
