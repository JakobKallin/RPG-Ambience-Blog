var exec = require('child_process').exec;
const SAXON_PATH = 'D:\\Saxon\\bin\\Transform.exe';

exec(SAXON_PATH + ' -s:blog.xml -xsl:files.xsl', function(error, stdout, stderr) {
	var paths = stdout.split('\n');
	paths.forEach(function(path) {
		xslt('post.xsl', 'blog.xml', path + '/index.html', {
			category: path.split('/')[0],
			slug: path.split('/')[1]
		});
	});
});

xslt('front-page.xsl', 'blog.xml', 'index.html');
xslt('atom.xsl', 'blog.xml', 'atom.xml', { timestamp: (new Date()).toISOString() });

function xslt(stylesheet, source, destination, params) {
	params = params || {};
	
	var command =
		SAXON_PATH +
		' -s:' + source +
		' -xsl:' + stylesheet +
		' -o:' + destination;
	
	for ( var key in params ) {
		var value = params[key];
		command += ' ' + key + '=' + value;
	}
	
	// We don't want whitespace between some nodes, so make sure there is no indentation.
	command += ' !indent=no';
	command += ' !include-content-type=no';
	
	console.log(command);
	exec(command, function(error) {
		if ( error ) {
			console.log(error);
		}
	});
}