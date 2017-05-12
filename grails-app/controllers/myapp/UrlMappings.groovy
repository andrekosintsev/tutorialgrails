package myapp

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

       "/"(controller: 'home', action: 'index')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
	
}
class IndexController {
	    def index() {  // index is the default action for any controller
    		[results:demo.RateObject.list()]
	    }
	}
