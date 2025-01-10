terraform { 
  cloud { 
    
    organization = "DigitalWitchng" 

    workspaces { 
      name = "kubernetes-google-gke" 
    } 
  } 
}