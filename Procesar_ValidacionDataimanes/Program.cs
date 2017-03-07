using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

using System.IO;
using System.Net;
using Tamir.SharpSsh;
using WinSCP;


namespace Procesar_ValidacionDataimanes
{

    // public string PathFTPServer = "/home/dataimagenes/pagoefectivo/home/pagoefectivo/SALIDA";
    //public string LocalPath="F:\\ValidarDataimages\\";
    class Program
    {

        static void Main(string[] args)
        {

            string PathFTPServerSalida = ConfigurationManager.AppSettings["PathFTPServerSalida"];
            string PathFTPServerEntrada = ConfigurationManager.AppSettings["PathFTPServerEntrada"];

            string LocalPathTosaveFiles = ConfigurationManager.AppSettings["LocalPathTosaveFiles"];
            string LocalPathToPutFiles = ConfigurationManager.AppSettings["LocalPathToPutFiles"];
            string PortNumber = ConfigurationManager.AppSettings["PortNumber"];
            string PassworDataImagenes = ConfigurationManager.AppSettings["PassworDataImagenes"];
            string UserNameDataImagenes = ConfigurationManager.AppSettings["UserNameDataImagenes"];
            string HostNameDataImagenes = ConfigurationManager.AppSettings["HostNameDataImagenes"];
            string SshHostKeyFingerprintDataImagenes = ConfigurationManager.AppSettings["SshHostKeyFingerprintDataImagenes"];
            string SshPrivateKeyPathDataImagenesConfiguration = ConfigurationManager.AppSettings["SshPrivateKeyPathDataImagenesConfiguration"];
            string SshPrivateKeyPassphraseDataImages = ConfigurationManager.AppSettings["SshPrivateKeyPassphraseDataImages"];
            GetAllFilesFromLocalPath(LocalPathToPutFiles);
            //GetAllFilesSFTP(PathFTPServerSalida, LocalPathTosaveFiles, PortNumber, PassworDataImagenes, UserNameDataImagenes, HostNameDataImagenes, SshHostKeyFingerprintDataImagenes, SshPrivateKeyPathDataImagenesConfiguration, SshPrivateKeyPassphraseDataImages);
            SaveFileValidaDataImagenes(LocalPathToPutFiles, PathFTPServerEntrada, PortNumber, PassworDataImagenes, UserNameDataImagenes, HostNameDataImagenes, SshHostKeyFingerprintDataImagenes, SshPrivateKeyPathDataImagenesConfiguration, SshPrivateKeyPassphraseDataImages);

        }
        public static void GetAllFilesSFTP(string PathFTPServerSalida, string LocalPathTosaveFiles, string PortNumber, string PassworDataImagenes, string UserNameDataImagenes, string HostNameDataImagenes, string SshHostKeyFingerprintDataImagenes, string SshPrivateKeyPathDataImagenesConfiguration, string SshPrivateKeyPassphraseDataImages)
        {
            try
            {

                SessionOptions Sessionobj = new SessionOptions();
                Sessionobj.Protocol = Protocol.Sftp;
                Sessionobj.PortNumber = int.Parse(PortNumber);
                Sessionobj.Password = PassworDataImagenes;
                Sessionobj.UserName = UserNameDataImagenes;
                Sessionobj.HostName = HostNameDataImagenes;
                Sessionobj.SshHostKeyFingerprint = SshHostKeyFingerprintDataImagenes;
                Sessionobj.SshPrivateKeyPath = SshPrivateKeyPathDataImagenesConfiguration;
                Sessionobj.SshPrivateKeyPassphrase = SshPrivateKeyPassphraseDataImages;

                using (Session sessiones = new Session())
                {
                    sessiones.AddRawConfiguration("AgentFwd", "1");
                    sessiones.Open(Sessionobj);

                    TransferOptions OpDescargas = new TransferOptions();
                    OpDescargas.TransferMode = TransferMode.Binary;
                    TransferOperationResult ResultTranfer;
                    ResultTranfer = sessiones.GetFiles(PathFTPServerSalida, LocalPathTosaveFiles, false, OpDescargas);
                    ResultTranfer.Check();
                    foreach (TransferEventArgs Tran in ResultTranfer.Transfers)
                    {

                        Console.WriteLine("Descargado de  {0} exito ", Tran.FileName);
                    }

                };



            }
            catch (Exception ex)
            {

                throw ex;



            }
        }

        public static void SaveFileValidaDataImagenes(string LocalPathToPutFiles, string PathFTPServerEntrada, string PortNumber, string PassworDataImagenes, string UserNameDataImagenes, string HostNameDataImagenes, string SshHostKeyFingerprintDataImagenes, string SshPrivateKeyPathDataImagenesConfiguration, string SshPrivateKeyPassphraseDataImages)
        {
            try
            {


                SessionOptions Sessionobj = new SessionOptions();
                Sessionobj.Protocol = Protocol.Sftp;
                Sessionobj.PortNumber = int.Parse(PortNumber);
                Sessionobj.Password = PassworDataImagenes;
                Sessionobj.UserName = UserNameDataImagenes;
                Sessionobj.HostName = HostNameDataImagenes;
                Sessionobj.SshHostKeyFingerprint = SshHostKeyFingerprintDataImagenes;
                Sessionobj.SshPrivateKeyPath = SshPrivateKeyPathDataImagenesConfiguration;
                Sessionobj.SshPrivateKeyPassphrase = SshPrivateKeyPassphraseDataImages;

                using (Session sessiones = new Session())
                {
                    sessiones.AddRawConfiguration("AgentFwd", "1");
                    sessiones.Open(Sessionobj);

                    TransferOptions OpDescargas = new TransferOptions();
                    OpDescargas.TransferMode = TransferMode.Binary;
                    TransferOperationResult ResultTranfer;
                    ResultTranfer = sessiones.PutFiles(LocalPathToPutFiles, PathFTPServerEntrada, false, OpDescargas);
                    ResultTranfer.Check();
                    foreach (TransferEventArgs Tran in ResultTranfer.Transfers)
                    {

                        Console.WriteLine("Descargado al SFTP de  {0} exito ", Tran.FileName);
                    }

                };




            }



            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static Queue<string> GetAllFilesFromLocalPath(string LocalPath) 
        {
           
            var listDirectories = Directory.GetFiles(@LocalPath);
            Queue<string> ListFiles = new Queue<string>(listDirectories);
            return ListFiles;
        }
    }
}
