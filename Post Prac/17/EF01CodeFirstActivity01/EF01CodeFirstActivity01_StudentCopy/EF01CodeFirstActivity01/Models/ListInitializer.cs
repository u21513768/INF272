using System.Collections.Generic;
using System.Data.Entity;

namespace ClassActivity.Models
{
    public class ListInitializer : DropCreateDatabaseIfModelChanges<ListDbContext>
    {
        protected override void Seed(ListDbContext context)
        {
            var Lists = new List<List>
            {
                new List{
                    ListID=1,
                    ListCode="Example 01",
                    Name="Example 01",
                    Description="Example 01",
                    ListItemTypeID=1,
                    PriorityID=1
                },
                new List{
                    ListID=1,
                    ListCode="Example 02",
                    Name="Example 02",
                    Description="Example 02",
                    ListItemTypeID=2,
                    PriorityID=2
                },
            };

            {
                var ListItemTypes = new List<ListItemType>
                {
                    new ListItemType{
                        ListItemTypeID=1,
                        ListItemTypeDescription="ExampleType 01"
                    },
                    new ListItemType{
                        ListItemTypeID=2,
                        ListItemTypeDescription="ExampleType 02"
                    }
                };

                var Priorities = new List<Priority>
                {
                    new Priority{
                        PriorityID=1,
                        PriorityDescription="ExampleDesc 01"
                    },
                    new Priority{
                        PriorityID=2,
                        PriorityDescription="ExampleDesc 02"
                    }
                };

                {
                    Lists.ForEach(xx => context.Lists.Add(xx));
                    ListItemTypes.ForEach(yy => context.ListItemTypes.Add(yy));
                    Priorities.ForEach(zz => context.Priorities.Add(zz));

                    context.SaveChanges();
                }
            }
        }
    }
}