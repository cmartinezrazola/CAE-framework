*KEYWORD
$-------------------------------------------------------------------------------
$
$ Bluebook Inc.
$ 1416 Ava St., Suite 900
$ Sunnyvale, CA 94856
$ USA
$ Tel.: +1 408-863-5000 | Fax: +1 408-863-5020
$ Caleb.Gleeson@bluebook.com | www.bluebook.com
$
$ "Simple is better than complex"
$ "Readability counts"
$
$-------------------------------------------------------------------------------
$ mm kg ms kN GPa J K kW
$ Aluminium: 
$ rho = 2.7E-6       1E6 g/cm3
$ E   = 69.              GPa
$ k   = 126.E-6      1E6 W/mK
$ h   = 20.E-9       1E9 W/m2K 
$ cp  = 910.             J/kgK
$ S-B = 5.67E-17     1E9 W/m2K4
$ mu  = 0.8908E-9    1E6 kg/ms
$ g   = 9.81E-3      1E3 N/kg
$-------------------------------------------------------------------------------
*TITLE
00000001
*PARAMETER_EXPRESSION
R ENDTIME 100.1*2
R BVELKMH 16.452/2
$-------------------------------------------------------------------------------
*DEFINE_TRANSFORMATION
$   TRANID
       100
SCALE            1.0       1.0       1.0
ROTATE           0.0       0.0       1.0       0.0       0.0       0.0      90.0
TRANSL       1312.45   -903.12     71.79
$-------------------------------------------------------------------------------
*INCLUDE
..\..\dyn\E\000_material\000_material.002.key
*INCLUDE
..\..\dyn\E\000_material\000_material_NINN.002.key
*INCLUDE
..\..\dyn\E\000_material\dont_write.key
*INCLUDE
..\..\dyn\E\900_body\900_body_NINN.003.key
*INCLUDE
..\..\dyn\E\500_front_door\500_front_door_NINN_BSGL.007.key
*INCLUDE_TRANSFORM
..\..\dyn\E\100_loadcase\100_crush_pole.003.key
$   IDNOFF    IDEOFF    IDPOFF    IDMOFF    IDSOFF    IDFOFF    IDDOFF
         0         0         0         0         0         0         0
$   IDROFF    PREFIX    SUFFIX
         0
$   FCTMAS    FCTTIM    FCTLEN    FCTTEM   INCOUT1
       1.0       1.0       1.0       1.0         0
$   TRANID
       100
$-------------------------------------------------------------------------------
*ELEMENT_BEAM
$    EID     PID      N1      N2      N3
50000501     1005000050190000501
50000502     1005000050290000502
50000503     1005000050390000503
50000504     1005000050490000504
50000505     1005000050590000505
50000506     1005000050690000506
50000507     1005000050790000507
50000508     1005000050890000508
*PART
GEB
$      PID       SEC       MID
       100       100       100
*SECTION_BEAM_TITLE
GEB
$    SECID    ELFORM      SHRF        QR       CST     SCOOR       NSM
       100         6        1.        2.        1.    
$      VOL      INER       CID     DOFN1     DOFN2
        1.        1.
$-------------------------------------------------------------------------------
*DEFORMABLE_TO_RIGID
$      PID       MRB     PTYPE
       100  10000100      PSET
$-------------------------------------------------------------------------------
$ Set Global contact deleted
$ Set Global tied deleted
$-------------------------------------------------------------------------------
*CONTACT_AUTOMATIC_SINGLE_SURFACE_ID
        99global_contact
$     SSID      MSID     SSTYP     MSTYP    SBOXID    MBOXID       SPR       MPR
        99         0         2         0         0         0         0         0
$       FS        FD        DC        VC       VDC    PENCHK        BT        DT
       0.2       0.0       0.0       0.0      20.0         0       0.0       0.0
$      SFS       SFM       SST       MST      SFST      SFMT       FSF       VSF
       0.0       0.0       0.0       0.0       0.0       0.0       0.0       0.0
$     SOFT    SOFSCL    LCIDAB    MAXPAR     SBOPT     DEPTH     BSORT    FRCFRQ
         1       0.0         0       0.0       0.0         0         0         0
$-------------------------------------------------------------------------------
*CONTACT_TIED_SHELL_EDGE_TO_SURFACE_ID_BEAM_OFFSET
        89global_tied
$     SSID      MSID     SSTYP     MSTYP    SBOXID    MBOXID       SPR       MPR
        89        99         2         2         0         0         0         0
$       FS        FD        DC        VC       VDC    PENCHK        BT        DT
       0.2       0.0       0.0       0.0      20.0         0       0.0       0.0
$      SFS       SFM       SST       MST      SFST      SFMT       FSF       VSF
       0.0       0.0      10.0       0.0       0.0       0.0       0.0       0.0
$-------------------------------------------------------------------------------
$$*DEFINE_FRICTION
$$       ID      FS_D      FD_D      DC_D      VC_D
$        99       0.3       0.0       0.0       0.0
$$    PID_I     PID_J     FS_IJ     FD_IJ     DC_IJ     VC_IJ
$  80009400  80010400       0.3       0.0       0.0       0.0
$-------------------------------------------------------------------------------
*LOAD_BODY_Z
$     LCID        SF    LCIDDR        XC        YC        ZC
         1   9.81E-3         0        0.        0.        0.
*DEFINE_CURVE_TITLE
Constant_1.0
$     LCID      SIDR       SFA       SFO      OFFA      OFFO
         1                 1.0       1.0       0.0       0.0
$                 A1                  O1
                 0.0                 1.0
              3600E3                 1.0
$-------------------------------------------------------------------------------
*CONTROL_ACCURACY
$      OSU       INN    PIDOSU
         0         4         0
*CONTROL_BULK_VISCOSITY
$       Q1        Q2       IHQ     BTYPE
       1.5     6.E-2        -1         0
*CONTROL_CONTACT
$   SLSFAC    RWPNAL    ISLCHK    SHLTHK    PENOPT    THKCHG     ORIEN    ENMASS
       0.0       0.0         2         2         1         1         1         0
$   USRSTR    USRFRC     NSBCS    INTERM     XPENE     SSTHK      ECDT   TIEDPRJ
         0         0         0         0       4.0         0         0         0
$    SFRIC     DFRIC       EDC       VFC        TH     TH_SF    PEN_SF
       0.0       0.0       0.0       0.0       0.0       0.0       0.0
$   IGNORE    FRCENG   SKIPRWG    OUTSEG   SPOTSTP   SPOTDEL   SPOTHIN
         2         0         0         0         0         0       0.5
*CONTROL_ENERGY
$     HGEN      RWEN    SLNTEN     RYLEN
         2         2         2         2
*CONTROL_DEBUG
*CONTROL_HOURGLASS
$      IHQ        QH
         8       0.1
*CONTROL_MPP_DECOMPOSITION_BAGREFF
*CONTROL_MPP_IO_NODUMP
*CONTROL_MPP_IO_NOBEAMOUT
*CONTROL_MPP_IO_NOFULL
*CONTROL_OUTPUT
$    NPOPT    NEECHO    NREFUP    LACCOP     OPIFS    IPNINT    IKEDIT    IFLUSH
         1         3         0         1       0.5                1000      1000
$    IPTRF    IERODE     TET10    MSGMAX    IPCURV      GMDT
         0         1         0     99000         1       0.0
*CONTROL_PARALLEL
$     NCPU    NUMRHS     CONST      PARA
         1         0         1         0
*CONTROL_SHELL
$   WRPANG     ESORT     IRNXX    ISTUPD    THEORY       BWC     MITER      PROJ
       40.         1        -1         1         2         0         1         1
$  ROTASCL    INTGRD    LAMSHT    CSTYP6   THSHELL    NFAIL1    NFAIL4   PSNFAIL
        0.                   1                   0
$  PSSTUPD    IRQUAD
         0
*CONTROL_SOLID
$    ESORT   FMATRIX   NIPTETS    SWLOCL
         1         0         0         0
*CONTROL_SOLUTION
$     SOLN       NLQ     ISNAN     LCINT
         0                   1      1001
*CONTROL_TIMESTEP
$   DTINIT    TSSFAC      ISDO    TSLIMT     DT2MS      LCTM     ERODE   MS1STst
        0.       0.9         0        0.   -0.0007         0         1         0
*CONTROL_TERMINATION
$   ENDTIM    ENDCYC     DTMIN    ENDENG    ENDMAS      NOSOL
&ENDTIME           0                           0.0          0
$-------------------------------------------------------------------------------
*DATABASE_ABSTAT
       0.1         2         0         0
*DATABASE_DEFORC
       0.1         2         0         0
*DATABASE_ELOUT
       0.1         2         0         0
*DATABASE_GLSTAT_MASS_PROPERTIES
       0.1         2         0         0
*DATABASE_SSSTAT_MASS_PROPERTIES
       0.1         2         0         0
*DATABASE_JNTFORC
       0.1         2         0         0
*DATABASE_MATSUM
       0.5         2         0         0
*DATABASE_NODOUT
       0.1         2         0         0
*DATABASE_RBDOUT
       5.0         2         0         0
*DATABASE_RWFORC
       0.1         2         0         0
*DATABASE_SECFORC
       0.1         2         0         0
*DATABASE_RCFORC
       0.1         2         0         0
*DATABASE_SBTOUT
       0.1         2         0         0
*DATABASE_SLEOUT
       0.1         2         0         0
*DATABASE_BNDOUT
       0.1         2         0         0
$*DATABASE_EXTENT_SSSTAT
$  10000099  50000099  90000099
*DATABASE_BINARY_D3PLOT
$       DT       LCD      BEAM     NPLTC    PSETID
       2.0         0         0         0         0
*DATABASE_BINARY_RUNRSF
$       DT       LCD      BEAM     NPLTC    PSETID
     10000         0         0         0         0
*DATABASE_BINARY_INTFOR
$       DT      LCDT
       2.0         0
*DATABASE_EXTENT_BINARY
$    NEIPH     NEIPS    MAXINT    STRFLG    SIGFLG    EPSFLG    RLTFLG    ENGFLG
         0         0         3         1         1         1         1         1
$   CMPFLG    IEVERP    BEAMIP     DCOMP      SHGE     STSSZ    N3THDT   IALEMAT
         1         1         0         0         0         3         0         0
$  NINTSLD   PKP_SEN      SCLP     HYDRO     MSSCL     THERM    INTOUT    NODOUT
         0         0        0.         0         0         0
*DATABASE_FORMAT
$    IFPRM   IBINARY
         0         1
*END