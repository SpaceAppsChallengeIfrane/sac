import json, sys
#add retrieve URL and store to file
json_data = open(sys.argv[1])
data = json.load(json_data)
with open(sys.argv[2], 'w') as outfile:
	for d in data:
		# Formatting data to be Used By MongoDB
		d["loc"]=[float(d.pop("lon")),float(d.pop("lat"))]
		#using line separator
		json.dump(d, outfile)
		#Seperating JSON entities
		outfile.write("\n")
#add mongoDb Connection