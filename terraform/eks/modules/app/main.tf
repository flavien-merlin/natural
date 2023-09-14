#-----------------------------------------------------------------------------------------------
#API CHUCK NORIS
#-----------------------------------------------------------------------------------------------

resource "helm_release" "apichuck" {
  name             = "apichuck"
  chart            = "${path.module}/helm/apichuck"
  namespace        = "apichuck"
  create_namespace = true
}