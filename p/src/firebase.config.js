// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDYzFafDPgaKQj47pw3dMq5oHLxZoGy22M",
  authDomain: "otp3-32794.firebaseapp.com",
  projectId: "otp3-32794",
  storageBucket: "otp3-32794.appspot.com",
  messagingSenderId: "1043381863366",
  appId: "1:1043381863366:web:f3ee19feb5b746497328c7",
  measurementId: "G-0VMP8YQ48Y"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

export const auth = getAuth(app);
