#!/bin/env python3.10

import os
import time


def main():
    priority = os.sched_get_priority_max(os.SCHED_FIFO) - 1
    param1 = os.sched_param(priority)
    param2 = os.sched_param(priority - 5)
    for x in range(5):
        print("Testing sys nice sched")
        print("Setting high prio")
        os.sched_setscheduler(0, os.SCHED_FIFO, param1)
        time.sleep(1)
        print("Setting low prio")
        os.sched_setscheduler(0, os.SCHED_FIFO, param2)
        time.sleep(3)
    print("DONE")


main()
