$(call setup-stamp-file,UFK_CBU_STAMP,cbu)
$(call setup-tmp-dir,UFK_TMPDIR)

UFK_INCLUDES := \
	kernel.mk \
	files.mk \
	lkvm.mk
# This directory will be used by the build-usr.mk
UFK_CBUDIR := $(UFK_TMPDIR)/cbu

S1_RF_USR_STAMPS += $(UFK_CBU_STAMP)
INSTALL_DIRS += $(UFK_CBUDIR):-

$(call inc-many,$(UFK_INCLUDES))

# Some input variables for building the ACI rootfs from CoreOS image
# (build-usr.mk).
CBU_MANIFESTS_DIR := $(MK_SRCDIR)/manifest.d
CBU_TMPDIR := $(UFK_CBUDIR)
CBU_DIFF := for-usr-from-kvm-mk
CBU_STAMP := $(UFK_CBU_STAMP)
CBU_ACIROOTFSDIR := $(S1_RF_ACIROOTFSDIR)
CBU_FLAVOR := kvm

$(call inc-one,../usr_from_coreos/build-usr.mk)

$(call undefine-namespaces,UFK)
