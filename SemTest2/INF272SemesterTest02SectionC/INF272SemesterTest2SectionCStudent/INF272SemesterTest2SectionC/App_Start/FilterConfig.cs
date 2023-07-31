using System.Web;
using System.Web.Mvc;

namespace INF272SemesterTest2SectionC
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
