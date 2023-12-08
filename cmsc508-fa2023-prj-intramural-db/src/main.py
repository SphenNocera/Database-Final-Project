from argparse import ArgumentError
from flask import Flask, Response, jsonify
from markupsafe import escape
from sql_helper import my_sql_statement, my_sql_wrapper


app = Flask(__name__)


@app.route("/")
def homepage():
    str = """Welcome to the VCU Intramural Sports API!
    <a href=./matches>Matches</a> 
     - <a href=./players>Players</a>
     - <a href=./sports>Sports</a>"""
    return str


@app.route("/matches/")
def get_matches():
    df = my_sql_wrapper(f"select * from matches")
    return Response(df.to_json(orient="records", date_format="iso"))


@app.route("/matches/<int:id>")
def get_match_by_id(id):
    df = my_sql_wrapper(f"select * from matches where match_id={id}")
    return df.to_json(orient="records", date_format="iso")


@app.route("/players/")
def get_players():
    df = my_sql_wrapper(f"select * from player")
    return df.to_json(orient="records", date_format="iso")


@app.route("/players/<int:id>")
def get_player_by_id(id):
    df = my_sql_wrapper(f"select * from player where player_id={id}")
    return df.to_json(orient="records", date_format="iso")


@app.route("/sports/")
def get_sport():
    df = my_sql_wrapper(f"select * from sport")
    return df.to_json(orient="records", date_format="iso")


@app.route("/sports/<int:id>")
def get_sport_by_id(id):
    df = my_sql_wrapper(f"select * from sport where sport_id={id}")
    return df.to_json(orient="records", date_format="iso")


if __name__ == "__main__":
    app.run()
