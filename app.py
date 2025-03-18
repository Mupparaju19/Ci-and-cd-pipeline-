from flask import Flask, render_template, request

app = Flask(__name__)

html = """
<!DOCTYPE html>
<html>
<head>
    <title>Simple Flask App</title>
</head>
<body>
    <h1>{{ message }}</h1>

    <form method="POST">
        <label for="name">Enter your names:</label>
        <input type="text" id="name" name="name">
        <button type="submit">Submit</button>
    </form>
</body>
</html>
"""

@app.route("/", methods=["GET", "POST"])
def home():
    message = ""
    if request.method == "POST":
        name = request.form.get("name")
        if name:
            message = f"Hello, {name}!"
        else:
            message = "Hello, World!"

    return html.replace("{{ message }}", message)  # Inline template rendering


if __name__ == "__main__":
    app.run(debug=True)
