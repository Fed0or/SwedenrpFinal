const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.getEvents = functions.https.onRequest(async (request, response) => {
  console.log('getEvents function called');
  try {
    const eventsRef = admin.firestore().collection('events');
    const snapshot = await eventsRef.orderBy('createdAt', 'desc').get();
    console.log(`Retrieved ${snapshot.size} events`);
    const events = [];
    snapshot.forEach(doc => {
      const data = doc.data();
      console.log('Event data:', data);
      events.push({ 
        id: doc.id, 
        content: data.content, 
        createdAt: data.createdAt.toDate().toISOString() 
      });
    });
    console.log('Sending events:', events);
    response.json(events);
  } catch (error) {
    console.error('Error fetching events:', error);
    response.status(500).send('Error fetching events: ' + error.message);
  }
});

exports.bookEvent = functions.https.onRequest(async (request, response) => {
  console.log('bookEvent function called');
  const { eventId, userId } = request.body;
  console.log('Received eventId:', eventId, 'userId:', userId);
  if (!eventId || !userId) {
    console.log('Missing eventId or userId');
    response.status(400).send('Missing eventId or userId');
    return;
  }

  try {
    const eventRef = admin.firestore().collection('events').doc(eventId);
    const event = await eventRef.get();
    if (!event.exists) {
      console.log('Event not found');
      response.status(404).send('Event not found');
      return;
    }

    await eventRef.update({
      bookedBy: admin.firestore.FieldValue.arrayUnion(userId)
    });
    console.log('Booking confirmed');
    response.send('Booking confirmed');
  } catch (error) {
    console.error('Error booking event:', error);
    response.status(500).send('Error booking event: ' + error.message);
  }
});