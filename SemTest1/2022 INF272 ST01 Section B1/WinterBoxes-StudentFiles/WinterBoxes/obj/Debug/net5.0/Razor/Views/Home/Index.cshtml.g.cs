#pragma checksum "C:\Web projects\INF 272\SemTest1\2022 INF272 ST01 Section B1\WinterBoxes-StudentFiles\WinterBoxes\Views\Home\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "8a0a6183663315a1fa6b083f4402085442a4eb31"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Home_Index), @"mvc.1.0.view", @"/Views/Home/Index.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Web projects\INF 272\SemTest1\2022 INF272 ST01 Section B1\WinterBoxes-StudentFiles\WinterBoxes\Views\_ViewImports.cshtml"
using WinterBoxes;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Web projects\INF 272\SemTest1\2022 INF272 ST01 Section B1\WinterBoxes-StudentFiles\WinterBoxes\Views\_ViewImports.cshtml"
using WinterBoxes.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"8a0a6183663315a1fa6b083f4402085442a4eb31", @"/Views/Home/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"f548a079a38632e83fc46e77c4629c1fa30bfdb9", @"/Views/_ViewImports.cshtml")]
    public class Views_Home_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<List<Box>>
    {
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.HeadTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper;
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n<!DOCTYPE html>\r\n<html>\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("head", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "8a0a6183663315a1fa6b083f4402085442a4eb313374", async() => {
                WriteLiteral("\r\n\r\n");
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.HeadTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("body", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "8a0a6183663315a1fa6b083f4402085442a4eb314344", async() => {
                WriteLiteral(@"
    <div class=""row"">
        <div class=""col-md-3"">
            <div class=""card"" style=""width: 20rem;"">
                <div class=""card-body"">
                    <h5 class=""card-title"">Box 1</h5>
                    <ul class=""card-text"">
                        <li>2x Grey Ceramic Mug</li>
                    </ul>
                    <button type=""button"" class=""btn btn-primary"" data-toggle=""modal"" data-target=""#myModal"">I am interested</button>
                </div>
            </div>
        </div>
    </div>

    <div class=""row"">
        <div class=""col-md-3"">
            <div class=""card"" style=""width: 20rem;"">
                <div class=""card-body"">
                    <h5 class=""card-title"">Box Alf</h5>
                    <ul class=""card-text"">
                        <li>Coffee plunger</li>
                    </ul>
                    <button type=""button"" class=""btn btn-primary"" data-toggle=""modal"" data-target=""#myModal"">I am interested</button>
                </div");
                WriteLiteral(@">
            </div>
        </div>
    </div>

    <div class=""row"">
        <div class=""col-md-3"">
            <div class=""card"" style=""width: 20rem;"">
                <div class=""card-body"">
                    <h5 class=""card-title"">The amante box</h5>
                    <ul class=""card-text"">
                        <li>Marshmallows</li>
                    </ul>
                    <button type=""button"" class=""btn btn-primary"" data-toggle=""modal"" data-target=""#myModal"">I am interested</button>
                </div>
            </div>
        </div>
    </div>

            <div class=""col-md-3"">
                <div class=""card"" style=""width: 20rem;"">
                    <div class=""card-body"">
                        <h5 class=""card-title"">Box surprise</h5>
                        <ul class=""card-text"">
                            <li>Scented Bubble Candle</li>
                        </ul>
                        <button type=""button"" class=""btn btn-primary"" data-toggle=""mod");
                WriteLiteral(@"al"" data-target=""#myModal"">I am interested</button>
                    </div>
                </div>
            </div>

            <div class=""modal fade"" id=""myModal"" tabindex=""-1"" role=""dialog"" aria-labelledby=""exampleModalLabel"" aria-hidden=""true"">
                <div class=""modal-dialog"" role=""document"">
                    <div class=""modal-content"">
                        <div class=""modal-header"">
                            <h5 class=""modal-title"" id=""exampleModalLabel"">Order box</h5>
                            <button type=""button"" class=""close"" data-dismiss=""modal"" aria-label=""Close"">
                                <span aria-hidden=""true"">&times;</span>
                            </button>
                        </div>
                        <div class=""modal-body"">
                            <p>Are you sure you want to order this box?</p>
                        </div>
                        <div class=""modal-footer"">
                            <button type=""button"" ");
                WriteLiteral(@"class=""btn btn-secondary"" data-dismiss=""modal"">Cancel</button>
                            <button type=""button"" class=""btn btn-primary"">Yes</button>
                        </div>
                    </div>
                </div>
            </div>
");
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n</html>\r\n");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<List<Box>> Html { get; private set; }
    }
}
#pragma warning restore 1591
