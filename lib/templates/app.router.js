app.router = {

    activeView:null,

    initialize:function () {
        _.extend(this, Backbone.Events);
        this.initializePageRouter();
        this.initializePage(window.location.pathname);
    },

    routes: {

    },

    initializePage: function(url){
        this.parseRoutes(url);
        this.initializeBaseViewIfNoneSet();
    },

    initializePageRouter:function () {
        this.pageRouter = crossroads.create();
        this.loadRoutes();
    },

    loadRoutes:function () {
       var _this = this;
        $.each(this.routes, function(route, viewName){
           _this.pageRouter.addRoute(route, function(){
              _this.activeView = new app.views[viewName];
           });
        });
    },

    parseRoutes:function (url) {
        this.pageRouter.parse(url);
    },

    initializeBaseViewIfNoneSet:function () {
        if (this.activeView == null) {
            this.activeView = new app.views.base();
        }
    }
};