class profile::workshop::p_http 
inherits profile::workshop {
    class {commun::http:
      maconf => hiera('maconf_valeur')
    }
}