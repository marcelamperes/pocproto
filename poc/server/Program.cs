using Grpc.Core;
using Services.Poc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace server
{
    class Program
    {
        static void Main(string[] args)
        {

            Server server = new Server
            {
                Services = { Logging.BindService(new LoggingService()) },
                Ports = { new ServerPort("localhost", 5000, ServerCredentials.Insecure) }
            };
            server.Start();

            Console.WriteLine("RouteGuide server listening on port 5000");
            Console.WriteLine("Press any key to stop the server...");
            Console.ReadKey();

            server.ShutdownAsync().Wait();


        }
    }

    class LoggingService : Logging.LoggingBase
    {
        public override Task<MessageResponse> SendMessage(MessageRequest request, ServerCallContext context)
        {
            return Task.FromResult(new MessageResponse { Success = true, Message = request.Message + " Há!" });
        }

        public override Task<MessageResponse> ReceiveMessage(MessageRequest request, ServerCallContext context)
        {
            return Task.FromResult(new MessageResponse() { Success = false, Message = request.Message + " hé!" });
        }
    }
}
