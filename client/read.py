import pravega_client
import asyncio

manager = pravega_client.StreamManager("127.0.0.1:9090")
manager.create_scope("death")
manager.create_stream("death", "note", 1)
writer = manager.create_writer("death", "note")
writer.write_event("data", "key")
writer.write_event("SCI")

async def create_task(reader):
    sl = await reader.get_segment_slice_async()
    for event in sl:
        print(event.data())

manager = pravega_client.StreamManager("127.0.0.1:9090")
reader_group = manager.create_reader_group("rg1", "death", "note")
reader = reader_group.create_reader("1")

asyncio.run(create_task(reader))
