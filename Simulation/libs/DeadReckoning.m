function RobotStates=DeadReckoning(RobotStates)
global t
TimeStraight=3;
TimeTurn=1;
l=40;
r=-40;
        if t<TimeStraight
            RobotStates.Rates.LeftWheel=l;
            RobotStates.Rates.RightWheel=l;
            return
        end
        if t<TimeStraight+TimeTurn
            RobotStates.Rates.LeftWheel=l;
            RobotStates.Rates.RightWheel=r;
            return
        end
        if t<TimeStraight+TimeTurn+TimeStraight
            RobotStates.Rates.LeftWheel=l;
            RobotStates.Rates.RightWheel=l;
            return
        end
        if t<TimeStraight+TimeTurn+TimeStraight+TimeTurn
            RobotStates.Rates.LeftWheel=l;
            RobotStates.Rates.RightWheel=r;
            return
        end
        if t<TimeStraight+TimeStraight+TimeTurn+TimeStraight+TimeTurn
            RobotStates.Rates.LeftWheel=l;
            RobotStates.Rates.RightWheel=l;
            return
        end
        if t<3*(TimeStraight+TimeTurn)
            RobotStates.Rates.LeftWheel=l;
            RobotStates.Rates.RightWheel=r;
            return
        end
        if t<TimeStraight+3*(TimeStraight+TimeTurn)
            RobotStates.Rates.LeftWheel=l;
            RobotStates.Rates.RightWheel=l;
            return
        end
        if t<4*(TimeStraight+TimeTurn)
            RobotStates.Rates.LeftWheel=l;
            RobotStates.Rates.RightWheel=r;
            return
        end
end