function toggle(chkbox, group) { 
    var visSetting = (chkbox.checked) ? "visible" : "hidden"; 
    document.getElementById(group).style.visibility = visSetting; 
} 
function swap(radBtn, group) { 
    var modemsVisSetting = (group == "modems") ? ((radBtn.checked) ? "" : "none") : "none"; 
    document.getElementById("modems").style.display = modemsVisSetting; 
} 
function show1(){
	  document.getElementById('div1').style.display ='none';
	  document.getElementById('div2').style.display ='none';
	  document.getElementById('div3').style.display ='none';
	  document.getElementById('div4').style.display = 'block';
	  document.getElementById('div5').style.display ='none';
	  document.getElementById('div6').style.display ='none';
	  document.getElementById('div7').style.display ='block';
	}
function show2(){
	  document.getElementById('div1').style.display = 'block';
	  document.getElementById('div5').style.display ='none';
	  document.getElementById('div6').style.display ='none';
	  document.getElementById('div7').style.display ='none';
	}
function show3(){
		  document.getElementById('div2').style.display ='none';
		  document.getElementById('div3').style.display = 'block';
		  document.getElementById('div4').style.display = 'none';
		  document.getElementById('div5').style.display ='none';
		  document.getElementById('div6').style.display ='none';
		  document.getElementById('div7').style.display ='none';
		}
function show4(){
		  document.getElementById('div3').style.display = 'none';
		  document.getElementById('div2').style.display = 'block';
		  document.getElementById('div4').style.display = 'none';
		  document.getElementById('div5').style.display ='none';
		  document.getElementById('div6').style.display ='none';
		  document.getElementById('div7').style.display ='none';
		}
function show5(){
	  document.getElementById('div1').style.display ='none';
	  document.getElementById('div2').style.display ='none';
	  document.getElementById('div3').style.display ='none';
	  document.getElementById('div4').style.display ='none';
	  document.getElementById('div5').style.display ='block';
	  document.getElementById('div6').style.display ='none';
	  document.getElementById('div7').style.display ='none';
}
function show6(){
	  document.getElementById('div1').style.display ='none';
	  document.getElementById('div2').style.display ='none';
	  document.getElementById('div3').style.display ='none';
	  document.getElementById('div4').style.display ='none';
	  document.getElementById('div5').style.display ='none';
	  document.getElementById('div6').style.display ='block';
	  document.getElementById('div7').style.display ='none';
}

 function showModel1(){


var container,controls,inputfield;
var clock = new THREE.Clock();
var camera, scene, renderer,projector,objects=[];
var markedpoints=[];
var mouseX = 0, mouseY = 0;
var clicks=0;
var clickedcolor=[];
var s;//index of the color to be assigned
var windowHalfX = window.innerWidth / 2;
var windowHalfY = window.innerHeight / 2;
//    var stats1;
var obj,gui;
var bind=[];//for descriptions
var curvepoints=[],counter=0;
var flag=0;//for controlling the display button

var vectors=[],removepoints=[];
//for color		

init();
animate();
   


function init() {

 //    stats1=initStats();
   
	container = document.createElement( 'div' );
	document.body.appendChild( container );

	camera = new THREE.PerspectiveCamera( 45, window.innerWidth / window.innerHeight, 1, 2000 );
	camera.position.z = 300;

	// scene

	scene = new THREE.Scene();
    scene.background = new THREE.Color( 0x000000 );
	
	var ambientLight = new THREE.AmbientLight( 0xcccccc, 0.4 );
	scene.add( ambientLight );

	var pointLight = new THREE.PointLight( 0xffffff, 0.8 );
	camera.add( pointLight );
	scene.add( camera );

	//R axes
			//AXIS
	 // show axes in the screen
<!-- var axes = new THREE.AxisHelper(7000); -->
<!-- scene.add(axes); -->

	
	
	// texture

	var manager = new THREE.LoadingManager();
	manager.onProgress = function ( item, loaded, total ) {

		console.log( item, loaded, total );

	};


	// model

	var onProgress = function ( xhr ) {
		if ( xhr.lengthComputable ) {
			var percentComplete = xhr.loaded / xhr.total * 100;
			console.log( Math.round(percentComplete, 2) + '% downloaded' );
		}
	};

	var onError = function ( xhr ) {
	};

	var loader = new THREE.OBJLoader( manager );
	loader.load( 'male.obj', function ( object ) {

		//R position the model
		object.position.x = 0;
		object.position.y = -110;
		object.position.z = 0;
		
		scene.add( object );
		// R SCALING
		objects.push(object);
		object.scale.x=10;
		object.scale.y=10;
		object.scale.z=10;

	}, onProgress, onError );

	//

	renderer = new THREE.WebGLRenderer();
	renderer.setPixelRatio( window.devicePixelRatio );
	renderer.setSize( window.innerWidth, window.innerHeight );
	container.appendChild( renderer.domElement );
   
//	document.addEventListener( 'mousemove', onDocumentMouseMove, false );

	
        






  //R orbit controls
	controls = new THREE.OrbitControls( camera, renderer.domElement );
	controls.target.set( 0,0,0);
	
	controls.update();

	controls.addEventListener( 'change', render );

	
	
	
	window.addEventListener( 'resize', onWindowResize, false );

//R add event	
    projector = new THREE.Projector();	
		// when the mouse moves, call the given function
  

//R dat.gui      
obj = {
message:' ',
Draw:false,
marktype:' ',

add:function()
{

console.log("clicks"+clicks);
if( obj.Draw==true && clicks>1)
{
var v=prompt("Enter the text");
obj.message=v;
console.log("obj.message"+obj.message);
clicks=0;  //reset
alert('Object added');

//for binding
binder(v,s);


//free array of curvepoints
while(curvepoints.length>0)
{
curvepoints.pop();
}
counter++;//for next curve 
}
else
{

alert("Please draw atleast one line and mark drawing");
}
},
submit:function()
{
	var k=JSON.stringify(bind);
	console.log(k);
		document.getElementById('modtext').value =k;

},

clear:function(){
console.log(markedpoints.length);
    var count=0;
	for(var i=0;i<markedpoints.length;i++)
	{scene.remove(markedpoints[i]);}
	count=markedpoints.length;
	for(var i=0;i<markedpoints.length;i++)
	{markedpoints.pop();}
	

//for removing the annotations if exist
var collection=document.getElementsByTagName("p");
console.log("total p tags"+collection.length);
var ob=document.getElementById("output");

for(var i=collection.length-1;i>=0;i--)
{
		  
ob.removeChild(collection[i]);               //iterate in opposite direction to delete nodes


}		

alert('Successfully removed  points')
clicks=0;//reset
},
Display:function(){


if(obj.Draw==false)
{
//clear the curves rendered before
var count=0;
	for(var i=0;i<markedpoints.length;i++)
	{scene.remove(markedpoints[i]);}
	count=markedpoints.length;
	for(var i=0;i<markedpoints.length;i++)
	{markedpoints.pop();}
	
//clear the rendered annotations
var collection=document.getElementsByTagName('p');
console.log("total p tags"+collection.length);
var ob=document.getElementById('output');

for(var i=collection.length-1;i>=0;i--)
{
		  
ob.removeChild(collection[i]);               //iterate in opposite direction to delete nodes


}		




obj.message="Displaying";
//for displaying already saved curves
console.log(bind.length);

for(var i=0;i<bind.length;i++)
{
for(var j=0;j<bind[i].points.length-1;j++)
{
 
 var v1=new THREE.Vector3(bind[i].points[j].x,bind[i].points[j].y,bind[i].points[j].z);
 var v2=new THREE.Vector3(bind[i].points[j+1].x,bind[i].points[j+1].y,bind[i].points[j+1].z);
 redraw(v1,v2,bind[i].colour);
  
}

//displaying the annotations
createannotation(bind[i]);

}

}
else
alert("Please unmark the draw option")

},

//	choosecolor:[ 0, 128, 255 ]

};

gui = new dat.gui.GUI();

//gui.remember(obj);
gui.add(obj,'message').listen();   //listen to the clicked event
gui.add(obj, 'Draw')
// Choose from accepted values
//  gui.add(obj, 'marktype', [ 'Point', 'Curve'] );

gui.add(obj, 'add');
//gui.addColor(obj,'choosecolor');
gui.add(obj,'clear');
gui.add(obj,'Display');
gui.add(obj,'submit');

window.addEventListener( 'mousedown', onDocumentMouseDown, false );

//  render();








}


//R mouse click
function onDocumentMouseDown( event ) 
{
// the following line would stop any other event handler from firing
// (such as the mouse's TrackballControls)
//event.preventDefault();
//R add when marking allowed


console.log("Clicked");

// update the mouse variable
mouseX = ( event.clientX / window.innerWidth ) * 2 - 1;
mouseY = - ( event.clientY / window.innerHeight ) * 2 + 1;

// find intersections

// create a Ray with origin at the mouse position
//   and direction into the scene (camera direction)

var vector = new THREE.Vector3( mouseX, mouseY, 1 );

vector.unproject( camera );
var ray = new THREE.Raycaster( camera.position, vector.sub( camera.position ).normalize() );

// create an array containing all objects in the scene with which the ray intersects
var intersects = ray.intersectObjects( objects,true);
// if there is one (or more) intersections


//nonmarking

if(obj.Draw==false && intersects.length>0)
{
console.log(bind[0].sphereobj.position.x+" "+bind[0].sphereobj.position.y+" "+bind[0].sphereobj.position.z);
console.log(intersects[0].point.x+" "+intersects[0].point.y+" "+intersects[0].point.z);
for(var i=0;i<bind.length;i++)
{
  if(bind[i].sphereobj.position.x==intersects[0].point.x && bind[i].sphereobj.position.y==intersects[0].point.y && bind[i].sphereobj.position.z==intersects[0].point.z)
     obj.message=bind[i].labeltext;
}

}








//marking


if(obj.Draw==true && intersects.length > 0)
{
var v=new THREE.Vector3(intersects[0].point.x,intersects[0].point.y,intersects[0].point.z);
curvepoints.push(v);

if(clicks==0)
{
vectors[clicks]=new THREE.Vector3(intersects[0].point.x,intersects[0].point.y,intersects[0].point.z);
clicks++;
//add color only once at the starting of loop

 s='#'+Math.random().toString(16).slice(-6) // six-number format aka #abc123

for(var i=0;i<bind.length;i++)
{
   if(bind[i].colour==s || bind[i].color=="#000000" || bind[i].color=="#ffffff")   //avoid black and white colour
        		s='#'+Math.random().toString(16).slice(-6) // six-number format aka #abc123	   
}

}
else 
{
vectors[clicks]=new THREE.Vector3(intersects[0].point.x,intersects[0].point.y,intersects[0].point.z);
draw(vectors[clicks-1],vectors[clicks]);
clicks++;
}

}















}

function draw(v1,v2)
{

  //Add curve

var a=(v1.x+v2.x)/2;
var b=(v1.y+v2.y)/2;
var c=(v1.z+v2.z)/2;
var v=new THREE.Vector3(a,b,c); //midpoint

var curve = new THREE.QuadraticBezierCurve3(v1,v,v2);



var points = curve.getPoints( 300 );





for(var i=0;i<300;i++)
{ var geometry = new THREE.SphereGeometry( 1,1,1 );

var material = new THREE.MeshBasicMaterial( {color: s} );
var sphere = new THREE.Mesh( geometry, material );
sphere.position.x=points[i].x; 
sphere.position.y=points[i].y;
sphere.position.z=points[i].z;
scene.add( sphere );
markedpoints.push(sphere);   //for clear
}




}



function redraw(v1,v2,z)
{

  //Add curve

var a=(v1.x+v2.x)/2;
var b=(v1.y+v2.y)/2;
var c=(v1.z+v2.z)/2;
var v=new THREE.Vector3(a,b,c); //midpoint

var curve = new THREE.QuadraticBezierCurve3(v1,v,v2);



var points = curve.getPoints( 300 );





for(var i=0;i<300;i++)
{ var geometry = new THREE.SphereGeometry( 1,1,1 );

var material = new THREE.MeshBasicMaterial( {color: z} );
var sphere = new THREE.Mesh( geometry, material );
sphere.position.x=points[i].x; 
sphere.position.y=points[i].y;
sphere.position.z=points[i].z;
scene.add( sphere );
markedpoints.push(sphere);   //for clear
}




}
function onWindowResize() {

	windowHalfX = window.innerWidth / 2;
	windowHalfY = window.innerHeight / 2;

	camera.aspect = window.innerWidth / window.innerHeight;
	camera.updateProjectionMatrix();
	renderer.setSize( window.innerWidth, window.innerHeight );
}
function onDocumentMouseMove( event ) {
	mouseX = ( event.clientX - windowHalfX ) / 2;
	mouseY = ( event.clientY - windowHalfY ) / 2;
}
//
function animate() {
	requestAnimationFrame( animate );
	render();
   update();    
}

function render() {
	camera.lookAt( scene.position );  
	renderer.render( scene, camera );
}
<!-- //binds sphere with text -->
function binder( t , c  )
{
bind[counter]=new Object();
bind[counter].text=t;
bind[counter].colour=c;

bind[counter].points=[];
for(var i=0;i<curvepoints.length;i++)
        bind[counter].points[i]=curvepoints[i];

console.log("object created with following properties")
console.log(bind[counter].text);
console.log(bind[counter].colour);
for(var i=0;i<bind[counter].points.length;i++)
  console.log(bind[counter].points[i].x+" "+bind[counter].points[i].y+" "+bind[counter].points[i].z);
var k=JSON.stringify(bind[counter]);
console.log(k);

}


function update()
{
controls.update();

if(obj.Draw==true)
obj.message="Drawing mode";
else
obj.message="Viewing mode";	
}

function createannotation(x)
{
var p=document.createElement('p');
var o=document.getElementById('output');
console.log("hello"+o);
p.textContent=x.text;
p.innerHTML+='<br>';  //for new line
// p.style.display="inline";
p.style.backgroundColor=x.colour;
p.style.fontSize="15px";
o.appendChild(p);
}
 }


