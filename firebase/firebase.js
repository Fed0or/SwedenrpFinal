// Import the functions you need from the Firebase SDKs
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyDyPyfy6aYzMRatbkNPLU6NjcuqXa0-jyk",
  authDomain: "swedenrp-e8315.firebaseapp.com",
  projectId: "swedenrp-e8315",
  storageBucket: "swedenrp-e8315.appspot.com",
  messagingSenderId: "217367637486",
  appId: "1:217367637486:web:70951aef02fec18ea4b2ff",
  measurementId: "G-LEB3M6VTX0"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);