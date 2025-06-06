module main

enum BucketId {
	one
	two
}

struct Solution {
	moves        int
	goal_bucket  BucketId
	other_bucket int
}

fn (s Solution) swap() Solution {
    g := if s.goal_bucket == .one { BucketId.two } else { BucketId.one }
    return Solution{moves: s.moves, goal_bucket: g, other_bucket: s.other_bucket}
}

pub fn measure(capacity_one int, capacity_two int, goal int, start_bucket BucketId) !Solution {
    if start_bucket == .two {
        return measure(capacity_two, capacity_one, goal, .one)!.swap()
    }

    if goal == 0 {
        return Solution{moves: 0, goal_bucket: .one, other_bucket: 0}
    }
    if capacity_one == goal {
        return Solution{moves: 1, goal_bucket: .one, other_bucket: 0}
    }
    if capacity_two == goal {
        return Solution{moves: 2, goal_bucket: .two, other_bucket: capacity_one}
    }

    mut steps := 0
    mut v1 := 0
    mut v2 := 0
    for v1 != 0 || v2 != capacity_two {
        steps += 2
        if v1 == 0 {
            v1 = capacity_one
        } else {
            v2 = 0
        }


        if v1 + v2 <= capacity_two {
            v2 += v1
            v1 = 0

            if v2 == goal {
                return Solution{moves: steps, goal_bucket: .two, other_bucket: 0}
            }
        } else {
            v1 -= capacity_two - v2
            v2 = capacity_two
            if v1 == goal {
                return Solution{moves: steps, goal_bucket: .one, other_bucket: capacity_two}
            }
        }
    }
    
    return error('impossible')
}
