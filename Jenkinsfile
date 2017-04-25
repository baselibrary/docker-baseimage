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
    dockerImage = docker.build("${image}:16.04", "16.04")
    docker.withRegistry("https://${registry}", 'registry-login') {
      dockerImage.push()
      dockerImage.push("latest")
    }
}
