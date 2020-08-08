import * as data from './data.json'
import * as localForage from 'localforage'
let lf =  localForage.default
class makeDB
	def constructor nm
		console.log "db instance created as '{nm}'"
		lf.createInstance({name: "{nm}"})
	def rm key
		console.log "-----"
		console.log "The '{key}'"
		lf.removeItem(key).then(do(v)
			console.log "-----"
			console.log(" key is cleared")
			).catch(do(err)
				console.log "-----"
				console.log " key could not be removed")
	def clear
		lf.clear().then(do(v)
			console.log "-----"
			console.log(v)
			).catch(do(err)
				console.log "-----"
				console.log(err)
				)
	def add key, value
		lf.setItem(key, value)
			.then( do(v)
				console.log "-----"
				console.log(v)
			)
			.catch do err
				console.log "-----"
				console.log err
	def get key
		lf.getItem(key)
			.then( do(v)
				console.log "-----"
				console.log (v)	
			)
			.catch do err
				console.log "-----"
				console.log err
	def long
		lf.length().then(do(num)
			console.log "-----"
			console.log num
			)
			.catch do err
				console.log "-----"
				console.log err
	def list
		lf.iterate(do(value, key, num)
			console.log "-----"
			console.log "{num} Value: {value}"
			console.log "Key:{key}"
			
			)
			.then(do
				console.log "-----"
				console.log 'Iteration has completed'
			)
			.catch(do(err)
				console.log "-----"
				console.log err
				)
	# Word Array
	def w lat, ipa, tra
		add("word",[lat,ipa,tra])
	# Translation Array (English, Description, Use, Khmer)
	def t eng, desc, use, kh
		[eng,desc,use,kh]


let dc = new makeDB

# [ # dictionary
# 	"string: latin",
# 	"string: ipa",
# 	[ # translations
# 		[eng, cham, use, kh]
# 		[eng, cham, use, kh]
# 	]
# ]

dc.w
	"cham"
	"ipa"
	dc.t
		"eng"
		"desc"
		"use"
		"kh"
dc.w
	"khmer"
	"lpa"
	dc.t
		"engs"
		"descs"
		"uses"
		"khs"

console.log dc.list

tag app-root
	css &
		ta:center
		d:block
	css %word
		bg: red
	def render
		<self>
			<h1> "hello!"
			for word in dict
				<div%word>
					for tr in word.trans
						<div> tr.eng
						<div> tr.inf
						<div> tr.use
						<div> tr.kh

imba.mount <app-root>