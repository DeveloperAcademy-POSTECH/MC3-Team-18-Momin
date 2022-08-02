//
//  MockDatas.swift
//  dorm
//
//  Created by Keum MinSeok on 2022/07/20.
//

import Foundation

#if DEBUG
final class MockDatas {

    static var students: [[Student]] = [
        [Student(50650454, "Olivia", nil, 101, 1),
        Student(29338735, "Amelia", nil, 101, 1)],
        [Student(85166274, "Hazel", nil, 102, 1),
        Student(86731607, "Lily", nil, 102, 1)],
        [Student(59301657, "Sophia", nil, 103, 1),
        Student(86222142, "Isabella", nil, 103, 1)],
        [Student(95553355, "Zoe", nil, 104, 1),
        Student(61555026, "Aria", nil, 104, 1)],
        [Student(66444682, "Grace", nil, 105, 1),
        Student(71871283, "Ava", nil, 105, 1)],
        [Student(77041682, "Oliver", nil, 106, 1),
        Student(15701689, "Harry", nil, 106, 1)],
        [Student(55109454, "Liam", nil, 107, 1),
        Student(47585862, "Lucas", nil, 107, 1)],
        [Student(10837856, "Declan", nil, 108, 1),
        Student(71764318, "Elliot", nil, 108, 1)],
        [Student(40643229, "Owen", nil, 109, 1),
        Student(88678526, "Theodore", nil, 109, 1)],
        [Student(11739976, "Jasper", nil, 110, 1),
        Student(73806302, "Oskar", nil, 110, 1)],
        [Student(98745866, "Alexander", nil, 111, 1),
        Student(69121668, "Troy", nil, 111, 1)],
        [Student(81477261, "Jetaime", nil, 112, 1),
        Student(46117757, "Cameron", nil, 112, 1)],
        [Student(94225807, "Jade", nil, 113, 1),
        Student(22209175, "Zana", nil, 113, 1)],
        [Student(72266833, "Agata", nil, 114, 1),
        Student(89992489, "Hardy", nil, 114, 1)],
        [Student(25167028, "Kaven", nil, 115, 1),
        Student(22933214, "Titus", nil, 115, 1)]
    ]
    static var dormRooms: [DormRoom] = [
        DormRoom(101, 2, [50650454, 29338735]),
        DormRoom(102, 2, [85166274, 86731607]),
        DormRoom(103, 2, [59301657, 86222142]),
        DormRoom(104, 2, [95553355, 61555026]),
        DormRoom(105, 2, [66444682, 71871283]),
        DormRoom(106, 2, [77041682, 15701689]),
        DormRoom(107, 2, [55109454, 47585862]),
        DormRoom(108, 2, [10837856, 71764318]),
        DormRoom(109, 2, [40643229, 88678526]),
        DormRoom(110, 2, [11739976, 73806302]),
        DormRoom(111, 2, [98745866, 69121668]),
        DormRoom(112, 2, [81477261, 46117757]),
        DormRoom(113, 2, [94225807, 22209175]),
        DormRoom(114, 2, [72266833, 89992489]),
        DormRoom(115, 2, [25167028, 22933214]),
        DormRoom(116, 2, []),
        DormRoom(117, 2, []),
        DormRoom(118, 2, [])
    ]
}
#endif
