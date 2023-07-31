using System.Web;
using System.Web.Mvc;

namespace INF272Semtest2SectionAQ1StudentFiles
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
