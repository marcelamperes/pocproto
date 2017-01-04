using Grpc.Core;
using Services.Poc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace client
{
    class Program
    {
        static void Main(string[] args)
        {
            Channel channel = new Channel("127.0.0.1:5000", ChannelCredentials.Insecure);
            var client = new Logging.LoggingClient(channel);

            // YOUR CODE GOES HERE
            MessageRequest request = new MessageRequest() { Message = "teste" };
            MessageResponse message = client.SendMessage(request);

            Console.WriteLine(message.Message);
            Console.ReadKey();

            channel.ShutdownAsync().Wait();


        }
    }
}
