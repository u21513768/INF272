using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace INF272SemesterTest2SectionB
    {
    public class MvcApplication : System.Web.HttpApplication
        {
        protected void Application_Start()
            {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            }
        }
    }