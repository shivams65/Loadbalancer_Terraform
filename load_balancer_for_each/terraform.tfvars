location = "east us"
rg_name  = "Shivam-resourcegroup"

vm = { 
    "vm1" = {
        "name" = "linuxvm01"
        "backendaddresspool_name" = "linuxvm01"
    },
    "vm2" = {
                "name" = "linuxvm02"
        "backendaddresspool_name" = "linuxvm02"
    }
}