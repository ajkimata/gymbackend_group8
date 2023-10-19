// // function solution(P, S) {
// //   // Calculate the difference between seating capacity and passengers for each car
// //   let differences = [];
// //   for (let i = 0; i < P.length; i++) {
// //     differences.push(S[i] - P[i]);
// //   }

// //   // Sort the differences
// //   differences.sort((a, b) => b - a);

// //   let carsNeeded = P.length;
// //   let left = 0,
// //     right = P.length - 1;

// //   while (left <= right) {
// //     // If a car with extra seats can accommodate the excess passengers of another car
// //     if (differences[left] + differences[right] >= 0) {
// //       carsNeeded--;
// //       left++;
// //       right--;
// //     } else {
// //       // If not, move to the next car with the most excess passengers
// //       left++;
// //     }
// //   }

// //   return carsNeeded;
// // }

// // // Test cases
// // console.log(solution([1, 4, 1], [1, 5, 1])); // Expected: 2
// // console.log(solution([4, 2, 4], [5, 5, 2])); // Expected: 3
// // console.log(solution([2, 3, 4, 2], [2, 5, 7, 2])); // Expected: 2
// function solution(P, S) {
//   let totalSeats = S.reduce((a, b) => a + b, 0);
//   let totalFriends = P.reduce((a, b) => a + b, 0);

//   if (totalFriends > totalSeats) {
//     return P.length; // All cars are needed as there are more friends than seats.
//   }

//   let fullCars = 0;
//   let extraSeats = 0;

//   for (let i = 0; i < P.length; i++) {
//     if (P[i] === S[i]) {
//       fullCars++; // This car is full
//     } else {
//       extraSeats += S[i] - P[i]; // Extra seats available in this car
//     }
//   }

//   let requiredCars = P.length - fullCars;
//   let emptyCars = 0;

//   for (let i = 0; i < P.length; i++) {
//     if (P[i] < S[i]) {
//       if (extraSeats + P[i] <= S[i]) {
//         extraSeats -= S[i] - P[i];
//         emptyCars++;
//       }
//     }
//   }

//   return requiredCars - emptyCars;
// }

// // Test cases
// console.log(solution([1, 4, 1], [1, 5, 1])); // Expected: 2
// console.log(solution([4, 2, 4], [5, 5, 2])); // Expected: 3
// console.log(solution([2, 3, 4, 2], [2, 5, 7, 2])); // Expected: 2
