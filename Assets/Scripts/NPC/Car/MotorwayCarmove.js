var agent : NavMeshAgent;
var ListOParking : GameObject[];
var Target : Transform;
var dist : float; // Distance to chosen parking space (Units)
var CanLeave : boolean;
var FoundSpace : boolean;
var IsDriving : boolean;
var IsParked : boolean;
var CarDriver : Transform;
var CarStartSound : AudioClip;
var CarStopSound : AudioClip;
var CanThink : boolean;
var CarIdleSound : AudioClip;
private var TOD : GameObject;
var TODScript;
private var Headlights : Transform;
private var audioSrc : AudioSource;
var NPCInstantiator : GameObject;
private var PersonSpawnPos : Vector3;


function OnTriggerEnter (collide : Collider)
{
	
	if (collide.gameObject.name == "_CarThinkStart")
	{
		CanThink = true;
	}
}

function Start ()
{
	audioSrc = GetComponent(AudioSource);
	ListOParking = GameObject.FindGameObjectsWithTag("Parking Space");
	CarDriver = transform.FindChild("Human");
	IsDriving = true;
	Headlights = transform.Find("Headlight");
	TOD = GameObject.Find("TOD");
	TODScript = TOD.GetComponent("TOD");
	NPCInstantiator = GameObject.Find("NPC_node_Spawn1");
}

function PlayDriveSound ()
{
	if (audioSrc.isPlaying == true)
	{
		yield WaitForSeconds (audioSrc.clip.length);
		
	}
	else
	{
		audioSrc.clip = CarIdleSound;
		audioSrc.Play();
	}
}

function Update () 
{
	
	if (IsDriving == true)
	{
		audioSrc.loop = true;
		PlayDriveSound();
	}
	else
	{
		audioSrc.loop = false;

	}
	
	if ( !FoundSpace )
	{
		for ( i = 0; i < ListOParking.Length; i++ )
		{
			if ( ListOParking[i].transform.GetComponent("MotorwayPSpace").IsOccupied == false )
			{
				Target = ListOParking[i].transform;
				Target.transform.GetComponent("MotorwayPSpace").IsOccupied = true;
				PersonSpawnPos = new Vector3 ((Target.transform.position.x - 5),Target.transform.position.y, Target.transform.position.z);
				FoundSpace = true;
				break;
			}
		
		}
	}
	
	
	if (FoundSpace == true)
	{
		agent.SetDestination(Target.position);
		dist = agent.remainingDistance;
	
		if (dist == 0 && FoundSpace == true && CanThink == true) //IF path completed
		{
			if (IsParked == false && dist == 0 )
			{
				ParkCar();
			}
			
			if (CanLeave)
			{
				Leave();
			}
		
		}
		else if (agent.pathStatus == NavMeshPathStatus.PathInvalid) //IF agent cannot path to location
		{
			agent.Warp(Target.position); //teleport
			
			
		}
	}
	
	if ( TODScript.Hour >= 19 || TODScript.Hour <= 5 )
	{
		Headlights.gameObject.SetActive(true);
	}
	else
	{
		Headlights.gameObject.SetActive(false);
	}
}

function ParkCar ()
{
	audioSrc.Stop();
	IsDriving = false;
	audioSrc.PlayOneShot(CarStopSound);
	IsParked = true;
	transform.rotation.y = 0;
	NPCInstantiator.GetComponent("NPC_Instantiate").Spawn(PersonSpawnPos, this.transform);
	CarDriver.gameObject.SetActive(false);
	
}

function Leave ()
{
	Debug.Log("Leave");
	CarDriver.gameObject.SetActive(true);
	IsDriving = true;
}
