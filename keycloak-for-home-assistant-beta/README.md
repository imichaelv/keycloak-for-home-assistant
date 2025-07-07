# Keycloak for Home assistant
#### This is a self-made addon to enable keycloak for Home Assistant

>[!WARNING] 
> <h3>Do not use this as OpenID provider for Home Assistant self.</h3>
> Since this is an addon for home assistant that handles authentication, it should not be in lead of authentication to home assistant. Falsely configurations can lead to permanent lockout of Home Assistant. Therefor use this addon only for other addons that might require an openID solution. 
> Do not use this as an OpenID for Home Assistant by itself, only for other addons that support OpenId.




# Installation

1. Add the addon through the following button:

    [![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fimichaelv%2Fkeycloak-for-home-assistant)

    This will add this repository in your addons list.
2. Install PhpMyAdmin from Home Assistant Addon Store
3. Execute following command to create a database for keycloak<br/>
    `CREATE DATABASE IF NOT EXISTS keycloak CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;`
4. Modify the configuration before first run. (Set up a random user and password for one-time admin creation, keep in mind, this user is temporary. default is admin/admin but this user needs to removed after first login)
5. With Nginx Proxy Manager create a new Host, and fill this host in the config of the addon
6. Start the application and create a new user inside keycloak and remove the default temporary admin user.


### Examples of configuration with ActualBudget

In this section I will explain how I use Keycloak, and how you might use it too.

The app that I will use is [ActualBudget](https://actualbudget.org/), this is a finance app that you can host on Home Assistant ([Addon page](https://github.com/sztupy/hassio-actualbudget)) . And it has OpenId as an authentication method.

The ActualBudget app can be replaced with any of your own apps, except for Home Assistant itself!

In the diagram here you see the network setup, Nginx exposes Home Assistant but not the other apps, even though an app might need openId, we can use Keycloak here. But also in this situation, keycloak is not exposed to the web.
```mermaid
flowchart BT
    subgraph Home Assistant 
        subgraph Nginx Proxy Manager 
            HA(Home Assistant)
            ActualBudget(ActualBudget)
            Keycloak
        end
    end
    Internet --> HA
    Home(Home Network) --> HA
    Home <--> ActualBudget
    Home <--> Keycloak
    Keycloak <-.-> ActualBudget
```


