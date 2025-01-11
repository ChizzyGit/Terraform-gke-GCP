terraform { 
  cloud { 
    
    organization = "SkyDolls-Tech" 

    workspaces { 
      name = "terraform-gke-kubenetes" 
    } 
  } 
}