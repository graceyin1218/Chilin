var mongoose = require ('mongoose');
var http = require ('http');
var express = require ('express');

////


var client = require('mongodb').MongoClient;

var products;

//var users;


client.connect('mongodb://localhost:27017', function(err, db) 
{
	if (err) throw err; 

	products = db.collection('products');

//	users = db.collection('users');
});

////

var path = require ('path');

var app = express();
app.set('port', process.env.PORT || 3000);

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(express.static(path.join(__dirname, 'public')));


app.get('/', function (req, res) 
{
	res.send('<html><body><h1>Hello World</h1></body></html>');
});


app.get('/:collection', function (req, res)
{
	var params = req.params;
	var collection; 
	this.getCollection(params, function (err, col)
	{
		if (err) throw err; 
	
		col.find().toArray(function(err, results)
		{
			if (err) throw err; 
			
			collection = results;
		}
	)});


	if (req.accepts('html'))
	{
		res.render('data', {objects: collection, collection: req.params.collection});
	}
	else
	{
		res.set('Content-Type', 'application/json');
		res.send(200, collection);
	}

});


app.use(function (req, res)
{
	res.render('404', {url : req.url});
});

http.createServer(app).listen(app.get('port'), function() 
{
	console.log('Express server listening on port ' + app.get('port'));
});


