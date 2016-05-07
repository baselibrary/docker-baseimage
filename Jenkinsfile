/***********************************************************************
 * Constants
 ***********************************************************************/
def image    = "baselibrary/baseimage"
def registry = "thoughtworks.io"

/***********************************************************************
 * Build code
 ***********************************************************************/

node('docker') {
  stage 'Build'
    dockerImage = docker.build("${image}:1.0.0", "1.0.0")
    docker.withRegistry("https://${registry}", 'registry-login') {
      dockerImage.push()
    }
    dockerImage = docker.build("${image}:2.0.0", "2.0.0")
    docker.withRegistry("https://${registry}", 'registry-login') {
      dockerImage.push()
      dockerImage.push("latest")
    }
}


