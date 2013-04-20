import json

json_data = open("py.json")
data = json.load(json_data)
with open('pypy.json', 'w') as outfile:
	for d in data:
		d["loc"]=[float(d.pop("lon")),float(d.pop("lat"))]
		json.dump(d, outfile)
		outfile.write("\n")