using System;
using Grpc.Core;
using Services.Poc;

namespace clientXamarin
{
	class MainClass
	{
		public static void Main(string[] args)
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
