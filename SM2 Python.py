import json
import sys
import math
import os
from datetime import date, datetime, timedelta, tzinfo
import time
from collections import defaultdict

def import_items(file_path):
	return json.loads(open(file_path, 'rb').read())

def export_items(items, file_path):
	open(file_path, "wb").write(json.dumps(items).encode())
	return True

def get_next_i_interval(item, reset=False):
	"""Get next inter-repetition interval after the n-th repetition"""
	if reset:
		item["i-interval"] = 1
	else:
		last_i_interval = item.get('i-interval', None)
		if last_i_interval:
			if last_i_interval > 2:
				item["i-interval"] = math.ceil(last_i_interval * item["e-factor"])
			item["i-interval"] = 6
	return item


def get_quality_of_repetition():
	prompt = "\nPlease enter the number that corresponds with your answer\n" + \
			"5 - perfect response\n" + \
			"4 - correct response after a hesitation\n" + \
			"3 - correct response recalled with serious difficulty\n" + \
			"2 - incorrect response; where the correct one seemed easy to recall\n" + \
			"1 - incorrect response; the correct one remembered\n" + \
			"0 - complete blackout.\n\n"
	while (1):
		q = input(prompt)
		#0 value doesnt work 
		if int(q):
			return int(q)

def change_e_factor(item, q):
	if q < 3:
		get_next_i_interval(item, reset=True)
	if item["e-factor"] >= 1.3:
		item["e-factor"] = item["e-factor"]+(0.1-(5-q)*(0.08+(5-q)*0.02))
	return item

def check_if_init_format(items):
	for k in items.keys():
		item = items[k]
		if not item.get("e-factor", None): 
			item["e-factor"] = 2.5
			items[k]=item
	return items


current_date = date.today()
#print(current_date)
current_time = time.asctime()
# print(current_time)
current_day = current_date.day
tomorrow = current_day + 1

def interval(item):
	interval_plus_time = current_day + item['i-interval']
	return interval_plus_time
def main(argv):
	file_path = argv
	items = import_items(file_path)
	for k in items.keys():
		item = items[k]
		items[str(k)]['date'] = current_day
		items[str(k)]['playdate'] = interval(item)
	items = check_if_init_format(items)
	export_items(items, file_path)
	q = 0
	while q <= 2:
		for k in items.keys():
			item = items[k]
			user_input = input("Question: " + item['question'] +"\nInput your answer: ")
			print("Correct answer: %s \n" % ( item["answer"] ))
			q = get_quality_of_repetition()
			item = change_e_factor(item, q)
			if q <= 3:
				reset = True
			else:
				reset = False
			item = get_next_i_interval(item, reset)
			items[k] = item
			export_items(items, file_path)
		if current_date == item['playdate']:
			user_input = input("Question: " + item['question'] +"\nInput your answer: ")
			print("Correct answer: %s \n" % ( item["answer"] ))
		else:
			print("COMPLETE")
			break
	


main('items.json')
#wait_until_repeat()



