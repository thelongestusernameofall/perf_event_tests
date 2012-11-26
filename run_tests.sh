#!/bin/sh

export TESTS_QUIET=y

echo
echo "* Checking infrastructure"
./validation/get_cache_info

echo
echo "* Checking generalized events"
./generalized_events/branches
./generalized_events/branch-misses
./generalized_events/cycles
./generalized_events/instructions
./generalized_events/l1-dcache-stores
./generalized_events/l1-dcache-loads

echo
echo "* Checking offcore response events"
./validation/offcore_response

echo
echo "* Checking events that require special permissions"
./validation_privileged/uncore_events

echo
echo "* Checking basic perf_event functionality"
./validation/format_id_support
./validation/non-existent
./validation/breakpoint_support
./validation/breakpoint_overflow
./validation/inherit
./validation/inherit_stat
./validation/enable_on_exec

echo
echo "* Checking overflow functionality"
./validation/simple_overflow_leader
./validation/simple_overflow_sibling
./validation/simultaneous_group_overflow
./validation/simultaneous_overflow
./validation/single_shot_overflow
./validation/single_shot_w_enable
./validation/wakeup_events_overflow

echo
echo "* Checking mmap record sample functionality"
./record_sample/print_record_sample
./record_sample/validate_record_sample
./record_sample/lost_record_sample

echo
echo "* Checking bugs that PAPI has to work around"
./bugs/sync_read_required
./bugs/read_group_attached
./bugs/check_schedulability
./bugs/check_papi_multiplexing
./bugs/check_multiplexing

echo
echo "* Checking bugs that can silently produce wrong results"
./validation/check_constraints
./corner_cases/context_switch_user_kernel

echo
echo "* Checking interfaces that have changed over the years"
./corner_cases/overflow_requires_mmap
./corner_cases/signal_after_exec
./corner_cases/sampled_notleader_refresh

echo
echo "* Checking for corner-cases in the ABI (not necessarily bugs)"
./corner_cases/multiple_active
./corner_cases/max_multiplex
./corner_cases/reset_leader
./corner_cases/check_reset_mpx

echo
echo "* Checking for fast RDPMC support"
./validation/rdpmc_support
./validation/rdpmc_validation

echo
echo "* Checking proposed interface updates (not in any released kernel)"
./corner_cases/ioctl_refresh_0
./corner_cases/wrong_size_enospc

echo
echo "* Checking for major bugs that are unlikely to ever be fixed"
./bugs/nmi_watchdog_group_leader

echo
