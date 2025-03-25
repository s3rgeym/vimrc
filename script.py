import requests

r = requests.get("https://ipinfo.io")
breakpoint()
data = r.json()
print(data)
