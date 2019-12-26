listener "tcp" {
  address          = "0.0.0.0:8200"
  cluster_address  = "192.168.100.22:8201"
  tls_disable      = "true"
}

storage "consul" {
  address = "192.168.100.13:8500"
  path    = "vault/"
  scheme  = "http"
  service = "vault"
}

api_addr = "http://192.168.100.22:8200"
cluster_addr = "http://192.168.100.22:8201"
ui = true