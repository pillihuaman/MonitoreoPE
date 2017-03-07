using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace Monitoreo.Models
{
    public class GetFileDirectoryPath
    {

        public static void  DirectoryInfo() {

            DirectoryInfo Info = new DirectoryInfo(System.Web.HttpContext.Current.Server.MapPath(@"~\"));
            var file = Info.GetFiles().ToList();
          
        }
    }
}