listener "tcp" {
  address          = "0.0.0.0:8200"
  cluster_address  = "192.168.100.21:8201"
  tls_disable      = "true"
}

storage "consul" {
  address = "192.168.100.11:8500"
  path    = "vault/"
  scheme  = "http"
  service = "vault"
}

api_addr = "http://192.168.100.21:8200"
cluster_addr = "http://192.168.100.21:8201"
ui = true